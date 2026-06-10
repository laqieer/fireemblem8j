	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8022200, "ax", %progbits
@ sub_8022200 @ JP 0x08022200 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022200
	.thumb_func
sub_8022200:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0802228C @ =0x085D14D4
	ldr r1, _08022290 @ =0x06005000
	bl sub_8013008
	ldr r0, _08022294 @ =0x085D188C
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08022298 @ =0x085D1A8C
	ldr r4, _0802229C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080222A0 @ =0x02022CAC
	movs r2, #0x8a
	lsls r2, r2, #6
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r2, _080222A4 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080222A8 @ =0x085C3A08
	adds r1, r5, #0
	bl Proc_StartBlocking
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802228C: .4byte 0x085D14D4
_08022290: .4byte 0x06005000
_08022294: .4byte 0x085D188C
_08022298: .4byte 0x085D1A8C
_0802229C: .4byte 0x02020188
_080222A0: .4byte 0x02022CAC
_080222A4: .4byte 0x03003020
_080222A8: .4byte 0x085C3A08

