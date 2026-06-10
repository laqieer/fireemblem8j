	.syntax unified
	.set sub_8035384, 0x08035384 + 1
	.section .text.SubtitleHelp_Loop, "ax", %progbits
@ SubtitleHelp_Loop @ JP 0x080355C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SubtitleHelp_Loop
	.thumb_func
SubtitleHelp_Loop:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0803560C @ =0x085C6690
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_8035384
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080355EA
	subs r0, r1, #1
	strh r0, [r4]
_080355EA:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035606
	movs r0, #0x1f
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08035606:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803560C: .4byte 0x085C6690

