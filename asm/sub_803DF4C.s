	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803DF4C, "ax", %progbits
@ sub_803DF4C @ JP 0x0803DF4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803DF4C
	.thumb_func
sub_803DF4C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _0803DFE4 @ =0x085D30F8
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	beq _0803DFC8
	ldr r0, _0803DFE8 @ =0x0203A4E8
	mov sb, r0
	ldr r1, _0803DFEC @ =0x0202E4D0
	mov r8, r1
_0803DF6A:
	mov r3, sb
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #1]
	mov r6, sb
	ldrb r6, [r6, #0x11]
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0803DFF0 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r7, r8
	movs r6, #0
	ldrsh r0, [r7, r6]
	cmp r2, r0
	bge _0803DFBC
	movs r2, #2
	ldrsh r0, [r7, r2]
	cmp r3, r0
	bge _0803DFBC
	cmp r1, #0
	beq _0803DFBC
	mov r3, sb
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803DFBC
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_0803DFBC:
	adds r4, #4
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _0803DF6A
_0803DFC8:
	ldr r0, _0803DFF4 @ =0x030017D0
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _0803DFD6
	movs r5, #0xa
_0803DFD6:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DFE4: .4byte 0x085D30F8
_0803DFE8: .4byte 0x0203A4E8
_0803DFEC: .4byte 0x0202E4D0
_0803DFF0: .4byte 0x0202E4D4
_0803DFF4: .4byte 0x030017D0

