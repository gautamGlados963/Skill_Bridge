package com.example.Skill_bridge.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import com.google.firebase.cloud.StorageClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.io.InputStream;

@Configuration
public class FirebaseConfig {

    @Bean
    public FirebaseApp initializeFirebaseApp() throws IOException {
        // Load Firebase service account credentials
        ClassPathResource serviceAccount = new ClassPathResource("firebase-credentials.json");
        InputStream serviceAccountStream = serviceAccount.getInputStream();

        // Initialize Firebase options
        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccountStream))
                .setDatabaseUrl("https://website-gp963.firebaseio.com") // Replace with your database URL
                .setStorageBucket("website-gp963.firebasestorage.app") // Replace with your storage bucket name
                .build();

        // Initialize Firebase app if not already initialized
        if (FirebaseApp.getApps().isEmpty()) {
            return FirebaseApp.initializeApp(options);
        } else {
            return FirebaseApp.getInstance();
        }
    }

    @Bean
    public Firestore firestore(FirebaseApp firebaseApp) {
        // Return Firestore instance
        return FirestoreClient.getFirestore(firebaseApp);
    }

    @Bean
    public Storage storage(FirebaseApp firebaseApp) {
        // Return Storage instance
        try {
			return StorageOptions.newBuilder()
			        .setCredentials(GoogleCredentials.getApplicationDefault())
			        .setProjectId(firebaseApp.getOptions().getProjectId())
			        .build()
			        .getService();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
}
