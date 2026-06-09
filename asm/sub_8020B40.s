	.syntax unified
	.set MaybeResetSomePal, 0x0800169C + 1
	.set MaybeSmoothChangeSomePal, 0x080016B8 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002330, 0x08002330 + 1
	.section .text.sub_8020B40, "ax", %progbits
@ sub_8020B40 @ JP 0x08020B40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020B40
	.thumb_func
sub_8020B40:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl sub_800226C
	bl MaybeResetSomePal
	ldr r6, _08020BA0 @ =0x020228A8
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r6, #0
	movs r1, #0
	movs r2, #3
	adds r3, r4, #0
	bl MaybeSmoothChangeSomePal
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl MaybeSmoothChangeSomePal
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #0xe
	movs r2, #2
	adds r3, r4, #0
	bl MaybeSmoothChangeSomePal
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0x12
	movs r2, #1
	adds r3, r4, #0
	bl MaybeSmoothChangeSomePal
	adds r5, #0x4c
	movs r0, #0xf
	strh r0, [r5]
	movs r0, #1
	bl sub_8002330
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020BA0: .4byte 0x020228A8

