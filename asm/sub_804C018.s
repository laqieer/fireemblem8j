	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitDisplayedSpritePalette, 0x080270E0 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_804C018, "ax", %progbits
@ sub_804C018 @ JP 0x0804C018 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C018
	.thumb_func
sub_804C018:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	bl sub_8000CD8
	ldr r2, _0804C114 @ =0x085D42D0
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	str r0, [sp]
	movs r0, #0
	mov r8, r0
_0804C03C:
	ldr r1, _0804C118 @ =0x080DEF04
	ldr r0, _0804C11C @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	mov r1, r8
	adds r1, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _0804C0FA
	movs r7, #0
	mov r0, r8
	lsls r0, r0, #2
	str r0, [sp, #8]
	ldr r1, _0804C120 @ =0x085B8D14
	mov sl, r1
	movs r0, #0xf
	mov sb, r0
_0804C070:
	ldr r0, _0804C124 @ =0x03001810
	ldr r1, [sp, #8]
	add r1, r8
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0804C0F4
	ldr r0, [r6]
	cmp r0, #0
	beq _0804C0F4
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C0F4
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r1, [sp]
	subs r4, r4, r1
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r3, r0, #0
	mov r0, sb
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0x9f
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl CallARM_PushToSecondaryOAM
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r0, [sp]
	subs r4, r4, r0
	adds r4, #8
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r3, r0, #0
	mov r1, sb
	ands r3, r1
	lsls r3, r3, #0xc
	ldr r0, _0804C128 @ =0x000009F2
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl CallARM_PushToSecondaryOAM
_0804C0F4:
	adds r7, #1
	cmp r7, #4
	ble _0804C070
_0804C0FA:
	ldr r1, [sp, #4]
	mov r8, r1
	cmp r1, #3
	ble _0804C03C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C114: .4byte 0x085D42D0
_0804C118: .4byte 0x080DEF04
_0804C11C: .4byte 0x085D31E8
_0804C120: .4byte 0x085B8D14
_0804C124: .4byte 0x03001810
_0804C128: .4byte 0x000009F2

