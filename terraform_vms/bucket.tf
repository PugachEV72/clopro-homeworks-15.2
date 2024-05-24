// Create Service Account
resource "yandex_iam_service_account" "servacc-for-bucket" {
    name      = "servacc-for-bucket"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "bucket-editor" {
    folder_id = var.folder_id
    role      = "storage.editor"
    member    = "serviceAccount:${yandex_iam_service_account.servacc-for-bucket.id}"
    depends_on = [yandex_iam_service_account.servacc-for-bucket]
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "servacc-static-key" {
    service_account_id = yandex_iam_service_account.servacc-for-bucket.id
    description        = "static access key for bucket"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "tanker72-bucket" {
    access_key = yandex_iam_service_account_static_access_key.servacc-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.servacc-static-key.secret_key
    bucket = "tanker72-first-bucket"
    acl    = "public-read"
    max_size   = 100000
}

// Add picture to bucket
resource "yandex_storage_object" "data-content" {
    access_key = yandex_iam_service_account_static_access_key.servacc-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.servacc-static-key.secret_key
    bucket = yandex_storage_bucket.tanker72-bucket.bucket
    key = "test_pic.jpg"
    source = "data/test_pic.jpg"
    acl    = "public-read"
    depends_on = [yandex_storage_bucket.tanker72-bucket]
}
