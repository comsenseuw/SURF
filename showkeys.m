clear all; close all; clc;
%% Muat gambar referensi, dan menghitung fitur SURF
test_image = imread('cartoon_test.jpeg');
test_img_gray = rgb2gray(test_image);
test_pts = detectSURFFeatures(test_img_gray)
figure; imshow(test_img_gray);
hold on; plot(test_pts);

%% Muat gambar latih
train_image = imread('cartoon_train.jpeg');
train_img_gray = rgb2gray(train_image);
% deteksi fitur gambar latih
train_pts = detectSURFFeatures(train_img_gray)
figure;imshow(train_img_gray);
hold on; plot(train_pts);