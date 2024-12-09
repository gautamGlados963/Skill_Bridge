package com.example.Skill_bridge.service;

import com.example.Skill_bridge.model.User;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.cloud.storage.*;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.ExecutionException;

@Service
public class FirebaseService {

    private final Firestore firestore;

    private static final String BUCKET_NAME = "website-gp963.firebasestorage.app";
    private static final String COLLECTION_NAME = "users";

    public FirebaseService(Firestore firestore) {
        this.firestore = firestore;
    }

    // Save user to Firestore
    public String saveUser(User user) throws ExecutionException, InterruptedException {
        ApiFuture<WriteResult> future = firestore.collection(COLLECTION_NAME).document(user.getEmail()).set(user);
        return "User registered at: " + future.get().getUpdateTime();
    }

    // Validate user credentials
    public User validateUser(String email, String password, String domain) throws ExecutionException, InterruptedException {
        DocumentReference docRef = firestore.collection(COLLECTION_NAME).document(email);
        ApiFuture<DocumentSnapshot> future = docRef.get();
        DocumentSnapshot document = future.get();

        if (document.exists()) {
            User user = document.toObject(User.class);
            if (user != null && user.getPassword().equals(password) && user.getDomain().equals(domain)) {
                return user;
            }
        }
        return null; // Invalid credentials
    }

    // Update user profile
    public void updateUser(User user) {
        try {
            DocumentReference userRef = firestore.collection(COLLECTION_NAME).document(user.getEmail());

            Map<String, Object> updates = new HashMap<>();
            updates.put("name", user.getName());
            updates.put("mobile", user.getMobile());
            updates.put("address1", user.getAddress1());
            updates.put("address2", user.getAddress2());
            updates.put("postcode", user.getPostcode());
            updates.put("state", user.getState());
            updates.put("city", user.getCity());
            updates.put("education", user.getEducation());
            updates.put("country", user.getCountry());
            updates.put("domain", user.getDomain());
            updates.put("profilePictureUrl", user.getProfilePictureUrl());

            ApiFuture<WriteResult> future = userRef.set(updates, SetOptions.merge());
            WriteResult result = future.get();
            System.out.println("User profile updated successfully at: " + result.getUpdateTime());
        } catch (Exception e) {
            throw new RuntimeException("Failed to update user profile", e);
        }
    }

    // Count users with a specific domain
    public long countUsersByDomain(String domain) {
        try {
            ApiFuture<QuerySnapshot> query = firestore.collection(COLLECTION_NAME)
                    .whereEqualTo("domain", domain)
                    .get();

            QuerySnapshot querySnapshot = query.get();
            return querySnapshot.getDocuments().size();
        } catch (Exception e) {
            throw new RuntimeException("Failed to count users by domain", e);
        }
    }

    // Upload profile picture to Firebase Storage
    public String uploadProfilePicture(String email, MultipartFile profilePicture) throws IOException {
        String fileName = "profile-pictures/" + email + ".jpg"; // Unique path for the file
        Storage storage = StorageOptions.getDefaultInstance().getService();

        BlobId blobId = BlobId.of(BUCKET_NAME, fileName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setContentType(profilePicture.getContentType())
                .build();

        storage.create(blobInfo, profilePicture.getBytes());

        return String.format("https://storage.googleapis.com/%s/%s", BUCKET_NAME, fileName);
    }
}
