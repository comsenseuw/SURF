clear all; close all; clc;
tic
%% Muat gambar referensi, dan menghitung fitur SURF
test_image = imread('cartoon_test.jpeg');
test_img_gray = rgb2gray(test_image);
test_pts = detectSURFFeatures(test_img_gray)
[test_features,  test_validPts] = extractFeatures(test_img_gray,  test_pts);

%% Muat gambar latih
train_image = imread('cartoon_train.jpeg');
train_image_gray = rgb2gray(train_image);

% deteksi fitur gambar latih
train_pts = detectSURFFeatures(train_image_gray)
[train_features, train_validPts] = extractFeatures(train_image_gray, train_pts);

%% Membandingkan gambar latiih dan gambar referensi
index_pairs = matchFeatures(test_features, train_features);

matched_points = test_validPts(index_pairs(:,1))
test_matched_pts = test_validPts(index_pairs(:,1)).Location;
train_matched_pts = train_validPts(index_pairs(:,2)).Location;

figure, showMatchedFeatures(train_image_gray, test_img_gray, train_matched_pts, test_matched_pts, 'montage');
title('Showing all matches');
toc


