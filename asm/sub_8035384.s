	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_8035384, "ax", %progbits
@ sub_8035384 @ JP 0x08035384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035384
	.thumb_func
sub_8035384:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	movs r5, #0
_0803538E:
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #0x20
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __modsi3
	ldr r1, _080353DC @ =0x085C662C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _080353E0 @ =0x00004240
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r7, #0
	ldr r3, _080353E4 @ =0x085B8D24
	bl PutSprite
	adds r5, #1
	cmp r5, #8
	ble _0803538E
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080353DC: .4byte 0x085C662C
_080353E0: .4byte 0x00004240
_080353E4: .4byte 0x085B8D24

