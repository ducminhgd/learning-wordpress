<?php
    defined('THEME_URL', get_stylesheet_directory());

    /**
     *  Setup theme
     */
    if (!function_exists('minhgdd_theme_setup')) {
        function minhgdd_theme_setup() {
            add_theme_support( 'automatic-feed-links' );
            add_theme_support( 'post-thumbnails' );
            add_theme_support( 'title-tag' );
            add_theme_support( 'post-formats',
                array(
                    'image',
                    'video',
                    'gallery',
                    'quote',
                    'link'
                )
            );
        }
        add_action('init', 'minhgdd_theme_setup');
    }