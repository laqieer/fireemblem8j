	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set PutAppliedBitmap, 0x080131BC + 1
	.set ShouldFaceBeRaised, 0x08005B28 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8005A7C, 0x08005A7C + 1
	.set sub_8005AD0, 0x08005AD0 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8005BA8, "ax", %progbits
@ sub_8005BA8 @ JP 0x08005BA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005BA8
	.thumb_func
sub_8005BA8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq _08005C58
	adds r0, r5, #0
	bl GetPortraitData
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, [r4]
	cmp r0, #0
	beq _08005C38
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r5, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08005C10
	lsls r1, r7, #0xc
	ldr r0, _08005C0C @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_8005AD0
	b _08005C20
	.align 2, 0
_08005C0C: .4byte 0x000003FF
_08005C10:
	lsls r1, r7, #0xc
	ldr r0, _08005C34 @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_8005A7C
_08005C20:
	movs r2, #0
	mov r0, sb
	movs r1, #4
_08005C26:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _08005C26
	b _08005C58
	.align 2, 0
_08005C34: .4byte 0x000003FF
_08005C38:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	lsls r1, r7, #0xc
	ldr r0, _08005C64 @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	movs r2, #0xa
	movs r3, #9
	bl PutAppliedBitmap
_08005C58:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005C64: .4byte 0x000003FF

