	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053298, "ax", %progbits
@ sub_8053298 @ JP 0x08053298 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053298
	.thumb_func
sub_8053298:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne _080532BE
	ldr r0, [r2, #0x64]
	bl GetAnimAnotherSide
	movs r0, #4
	bl BG_EnableSyncByMask
	b _080532D4
_080532BE:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080532D4
	ldr r1, _080532D8 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl sub_8002DE4
_080532D4:
	pop {r0}
	bx r0
	.align 2, 0
_080532D8: .4byte 0x02017728

