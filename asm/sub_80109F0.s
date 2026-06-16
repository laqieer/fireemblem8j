	.syntax unified
	.set AddMenuOverride, 0x080504F0 + 1
	.set ResetMenuOverrides, 0x0805046C + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80109F0, "ax", %progbits
@ Event3D_MenuOverride @ JP 0x080109F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event3D_MenuOverride
	.thumb_func
Event3D_MenuOverride:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08010A58 @ =0x080DC56F
	mov r0, sp
	movs r2, #0xf
	bl memcpy
	add r4, sp, #0x10
	ldr r1, _08010A5C @ =0x080DC57E
	adds r0, r4, #0
	movs r2, #5
	bl memcpy
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r5, #0xf
	ands r5, r0
	ldrh r7, [r1, #2]
	bl ResetMenuOverrides
	movs r6, #1
	mov r8, r4
	cmp r5, #1
	beq _08010A64
	cmp r5, #1
	bgt _08010A94
	cmp r5, #0
	bne _08010A94
	movs r5, #0
_08010A30:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq _08010A46
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	movs r1, #1
	ldr r2, _08010A60 @ =sub_80501C4
	bl AddMenuOverride
_08010A46:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xe
	bls _08010A30
	b _08010A94
	.align 2, 0
_08010A58: .4byte 0x080DC56F
_08010A5C: .4byte 0x080DC57E
_08010A60: .4byte 0x080501C5  @ sub_80501C4
_08010A64:
	movs r5, #0
_08010A66:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq _08010A86
	mov r0, r8
	adds r4, r0, r5
	ldrb r0, [r4]
	movs r1, #1
	ldr r2, _08010AA4 @ =sub_80501C0
	bl AddMenuOverride
	ldrb r0, [r4]
	movs r1, #2
	ldr r2, _08010AA8 @ =sub_801B718
	bl AddMenuOverride
_08010A86:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08010A66
_08010A94:
	movs r0, #0
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010AA4: .4byte 0x080501C1  @ sub_80501C0
_08010AA8: .4byte 0x0801B719  @ sub_801B718

