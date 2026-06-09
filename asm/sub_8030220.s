	.syntax unified
	.set CallARM_PushToPrimaryOAM, 0x08002B1C + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_800219C, 0x0800219C + 1
	.section .text.sub_8030220, "ax", %progbits
@ sub_8030220 @ JP 0x08030220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030220
	.thumb_func
sub_8030220:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl sub_800219C
	cmp r0, #0
	beq _080302CA
	bl sub_8000CD8
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _080302D4 @ =0x020027DC
	adds r4, r1, r0
	mov r2, sp
	ldr r3, _080302D8 @ =0x0202BCAC
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _08030252
	adds r0, #0xf
_08030252:
	asrs r0, r0, #4
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r3, #0xe]
	strh r2, [r0, #2]
	mov r1, sp
	ldrh r0, [r3, #0xc]
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #6]
	mov r5, sp
	movs r7, #0xc
	ldrsh r1, [r3, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _08030278
	adds r0, #0xf
_08030278:
	asrs r0, r0, #4
	strh r0, [r5, #8]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r6, #0xff
	movs r5, #0x1f
_08030284:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrb r2, [r4, #9]
	lsls r2, r2, #2
	mov r7, sp
	adds r3, r7, r2
	movs r7, #0
	ldrsh r2, [r3, r7]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r7, #2
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	ldr r2, _080302DC @ =0x085B8CDC
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08030284
_080302CA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080302D4: .4byte 0x020027DC
_080302D8: .4byte 0x0202BCAC
_080302DC: .4byte 0x085B8CDC

