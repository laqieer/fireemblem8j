	.syntax unified
	.set sub_800F720, 0x0800F720 + 1
	.set LoadUnit_0, 0x0800F8D4 + 1
	.section .text.sub_800F86C, "ax", %progbits
@ sub_800F86C @ JP 0x0800F86C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F86C
	.thumb_func
sub_800F86C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r3, #0
	cmp r7, #2
	bne _0800F884
	movs r3, #1
_0800F884:
	mov r8, r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800F8C6
	cmp r6, #0
	ble _0800F8C6
	lsls r0, r6, #0x10
	ldr r1, _0800F8D0 @ =0xFFFF0000
	adds r5, r0, r1
_0800F896:
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_800F720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800F8BA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	mov r3, r8
	bl LoadUnit_0
	adds r0, r5, #0
	ldr r1, _0800F8D0 @ =0xFFFF0000
	adds r5, r5, r1
	asrs r6, r0, #0x10
_0800F8BA:
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800F8C6
	cmp r6, #0
	bgt _0800F896
_0800F8C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F8D0: .4byte 0xFFFF0000

