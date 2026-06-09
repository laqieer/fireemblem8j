	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80C3704, "ax", %progbits
@ sub_80C3704 @ JP 0x080C3704 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3704
	.thumb_func
sub_80C3704:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r1, _080C3740 @ =0x088582BC
	subs r4, #1
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #5
	adds r3, r4, #0
	bl sub_80043B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3740: .4byte 0x088582BC

