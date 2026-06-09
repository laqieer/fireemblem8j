	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnits, 0x0801756C + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80AB10C, 0x080AB10C + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_8043344, "ax", %progbits
@ sub_8043344 @ JP 0x08043344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043344
	.thumb_func
sub_8043344:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, _08043374 @ =0x085D33A8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl InitUnits
	cmp r4, #0
	beq _08043378
	cmp r4, #0
	blt _08043422
	cmp r4, #2
	bgt _08043422
	movs r6, #0
	b _080433E4
	.align 2, 0
_08043374: .4byte 0x085D33A8
_08043378:
	movs r6, #0
	mov r1, sb
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
_08043388:
	ldr r0, _080433A4 @ =0x0203DB78
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80AB10C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080433A8
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b _080433C4
	.align 2, 0
_080433A4: .4byte 0x0203DB78
_080433A8:
	movs r0, #0x61
	bl sub_8009FA8
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
_080433C4:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80AB354
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble _08043388
	adds r7, r6, #0
	b _08043422
_080433E4:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, _08043434 @ =0x0203DB78
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80AB10C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804341C
	mov r1, sb
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80AB354
	adds r7, #1
_0804341C:
	adds r6, #1
	cmp r6, #9
	ble _080433E4
_08043422:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043434: .4byte 0x0203DB78

