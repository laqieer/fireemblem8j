	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8048DC0, 0x08048DC0 + 1
	.section .text.sub_8048F24, "ax", %progbits
@ sub_8048F24 @ JP 0x08048F24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048F24
	.thumb_func
sub_8048F24:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08048F74 @ =0x085D3ECC
	lsls r2, r2, #2
	adds r5, r2, r0
	ldrh r4, [r5, #2]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_8048DC0
	ldrh r0, [r5]
	bl sub_8009FA8
	bl sub_8003E0C
	movs r1, #0x46
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r4, #0
	bne _08048F58
	subs r1, #0x20
_08048F58:
	adds r4, r1, #0
	adds r4, #0x28
	ldrh r0, [r5]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_80043B8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048F74: .4byte 0x085D3ECC

