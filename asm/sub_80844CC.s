	.syntax unified
	.set InitScanlineBuf, 0x080846E0 + 1
	.set SetScanlineBufWinL, 0x080846FC + 1
	.set SetScanlineBufWinR, 0x0808471C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80844CC, "ax", %progbits
@ sub_80844CC @ JP 0x080844CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80844CC
	.thumb_func
sub_80844CC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov sl, r2
	mov sb, r3
	ldr r5, [sp, #0x20]
	ldr r0, _080844EC @ =0x0203E750
	mov r8, r0
	ldr r0, [r0, #4]
	bl InitScanlineBuf
	b _08084522
	.align 2, 0
_080844EC: .4byte 0x0203E750
_080844F0:
	ldrb r0, [r5]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	mov r1, sb
	bl sub_80D6374
	adds r6, r0, #0
	adds r5, #1
	cmp r6, #0
	ble _08084520
	mov r1, r8
	ldr r0, [r1, #4]
	adds r1, r7, r6
	subs r1, #1
	adds r2, r4, #0
	bl SetScanlineBufWinR
	mov r1, r8
	ldr r0, [r1, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl SetScanlineBufWinL
_08084520:
	subs r4, #1
_08084522:
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0808452C
	cmp r4, #0
	bge _080844F0
_0808452C:
	cmp r6, #0
	ble _08084556
	cmp r4, #0
	blt _08084556
	ldr r5, _08084564 @ =0x0203E750
	adds r0, r7, r6
	mov r8, r0
_0808453A:
	ldr r0, [r5, #4]
	mov r1, r8
	subs r1, #1
	adds r2, r4, #0
	bl SetScanlineBufWinR
	ldr r0, [r5, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl SetScanlineBufWinL
	subs r4, #1
	cmp r4, #0
	bge _0808453A
_08084556:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084564: .4byte 0x0203E750

