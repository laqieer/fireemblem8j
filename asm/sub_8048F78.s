	.syntax unified
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8048F78, "ax", %progbits
@ sub_8048F78 @ JP 0x08048F78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048F78
	.thumb_func
sub_8048F78:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	ldr r0, _08048FB8 @ =0x000007BB
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0
	bl sub_80043B8
	ldr r0, _08048FBC @ =0x000007BC
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0
	bl sub_80043B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048FB8: .4byte 0x000007BB
_08048FBC: .4byte 0x000007BC

