# EmoTune: Emotion-Based Music Recommendation via Synthetic Vision

EmoTune is an innovative mobile application that bridges the gap between Computer Vision and personalized music therapy. The system analyzes a user's current emotional state using a model trained on entirely synthetic, prompt-generated imagery and provides curated YouTube music playlists to regulate or enhance the user's mood.

🚀 Key Features
Synthetic Data Driven: Unlike traditional models, this system evaluates the effectiveness of emotion recognition on AI-generated (synthetic) faces.

Real-time Emotion Detection: Analyzes 5 core emotions: Scared/Surprised, Neutral, Angry, Happy, and Sad.

Sentiment Correction: A smart logic layer that detects negative emotional states and suggests music specifically designed to improve the user's mood.

YouTube Integration: Leverages the YouTube Data API to fetch and play music directly within the app.

Transfer Learning Architecture: Utilizes state-of-the-art pre-trained models fine-tuned on our custom synthetic dataset for high accuracy.

🧠 Model & Dataset

The project explores a unique research question: Can models trained on synthetic humans accurately predict real or AI-generated emotional states? The dataset consists of thousands of images generated via prompt engineering, categorized into:

Fearful & Surprised 

Neutral 

Angry 

Happy 

Sad 

Training Logic
We employed Transfer Learning to maximize feature extraction efficiency. By freezing the early layers of a robust backbone (e.g., MobileNetV2 or ResNet), the model focuses on the nuances of facial expressions within the synthetic domain.

📱 Mobile Application Workflow
The app is designed for high user interactivity and seamless mood transitions.

Capture: User takes a selfie or uploads a photo.

Analyze: The TFLite-converted model processes the image on-device or via API.

Recommend: * If Happy/Neutral: Plays "Maintenance" tracks to keep the vibe.

If Angry/Sad/Scared: Plays "Corrective" tracks (Calm, Lo-fi, Upbeat) to shift the mood.

Stream: The YouTube API fetches the most relevant playlists and opens them for the user.
