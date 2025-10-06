// Photo Gallery Dynamic Loading
const photoFiles = [
    'R - 0.jpeg', 'R - 1.jpeg', 'R - 2.jpeg', 'R - 3.jpeg', 'R - 4.jpeg',
    'R - 5.jpeg', 'R - 6.JPG', 'R - 7.JPG', 'R - 8.JPG', 'R - 9.JPG',
    'R - 10.JPG', 'R - 11.JPG', 'R - 12.JPG', 'R - 13.jpeg', 'R - 14.jpg',
    'R - 15.jpg', 'R - 16.jpg', 'R - 17.jpg', 'R - 18.jpg', 'R - 20.JPG',
    'R - 21.JPG', 'R - 22.JPG', 'R - 23.JPG', 'R - 24.JPG', 'R - 25.jpeg',
    'R - 26.jpeg', 'R - 27.jpeg', 'R - 28.jpeg'
];

const gallery = document.getElementById('photoGallery');
const lightbox = document.getElementById('lightbox');
const lightboxImg = document.getElementById('lightbox-img');
const lightboxClose = document.querySelector('.lightbox-close');

// Load photos into gallery
photoFiles.forEach((photo, index) => {
    const item = document.createElement('div');
    item.className = 'gallery-item';
    item.innerHTML = `<img src="dist/${photo}" alt="Memory ${index + 1}" loading="lazy">`;
    item.addEventListener('click', () => openLightbox(`dist/${photo}`));
    gallery.appendChild(item);
});

// Lightbox functionality
function openLightbox(src) {
    lightboxImg.src = src;
    lightbox.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeLightbox() {
    lightbox.classList.remove('active');
    document.body.style.overflow = 'auto';
}

lightboxClose.addEventListener('click', closeLightbox);
lightbox.addEventListener('click', (e) => {
    if (e.target === lightbox) closeLightbox();
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeLightbox();
});

// Smooth scroll indicator fade
window.addEventListener('scroll', () => {
    const scrollIndicator = document.querySelector('.scroll-indicator');
    if (scrollIndicator) {
        const opacity = Math.max(0, 1 - window.scrollY / 300);
        scrollIndicator.style.opacity = opacity;
    }
});

// Intersection Observer for fade-in animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

document.querySelectorAll('.gallery-item, .tribute-text p').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(30px)';
    el.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
    observer.observe(el);
});
