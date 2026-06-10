	.syntax unified
	.set CallARM_PushToPrimaryOAM, 0x08002B1C + 1
	.set sub_800219C, 0x0800219C + 1
	.section .text.WfxFlamesUpdateParticles, "ax", %progbits
@ WfxFlamesUpdateParticles @ JP 0x08030898 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxFlamesUpdateParticles
	.thumb_func
WfxFlamesUpdateParticles:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08030924 @ =0x020027DC
	bl sub_800219C
	cmp r0, #0
	beq _08030918
	ldr r0, _08030928 @ =0x0202BCAC
	mov r8, r0
	movs r1, #0xff
	mov sb, r1
	movs r6, #0xf
_080308B4:
	ldrh r0, [r4, #4]
	ldrh r2, [r4]
	adds r5, r0, r2
	strh r5, [r4]
	ldrh r0, [r4, #6]
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r7, r8
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	subs r2, r0, r1
	mov r3, sb
	ands r2, r3
	cmp r2, #0x3f
	ble _08030910
	cmp r2, #0xa0
	bgt _08030910
	adds r1, r2, #0
	subs r1, #0x40
	cmp r1, #0
	bge _080308E6
	adds r1, #7
_080308E6:
	asrs r1, r1, #3
	movs r0, #0x1f
	subs r3, r0, r1
	cmp r3, #0x17
	bgt _080308F2
	movs r3, #0x18
_080308F2:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x18
	mov r5, r8
	movs r7, #0xc
	ldrsh r1, [r5, r7]
	subs r0, r0, r1
	mov r1, sb
	ands r0, r1
	movs r5, #0xa0
	lsls r5, r5, #8
	adds r3, r3, r5
	adds r1, r2, #0
	ldr r2, _0803092C @ =0x085B8CDC
	bl CallARM_PushToPrimaryOAM
_08030910:
	subs r6, #1
	adds r4, #0xc
	cmp r6, #0
	bge _080308B4
_08030918:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030924: .4byte 0x020027DC
_08030928: .4byte 0x0202BCAC
_0803092C: .4byte 0x085B8CDC

