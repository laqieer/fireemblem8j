	.syntax unified
	.set IsDivinationOptionAvailable, 0x080A2C10 + 1
	.set sub_8099308, 0x08099308 + 1
	.section .text.sub_8097778, "ax", %progbits
@ sub_8097778 @ JP 0x08097778 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097778
	.thumb_func
sub_8097778:
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r2, r0, #0
	adds r2, #0x2f
	strb r6, [r2]
	ldr r0, _080977D8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080977CE
	movs r4, #0
	adds r5, r2, #0
_08097794:
	adds r0, r4, #0
	bl IsDivinationOptionAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080977AA
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080977AA:
	adds r4, #1
	cmp r4, #3
	ble _08097794
	movs r0, #2
	bl IsDivinationOptionAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080977BE
	movs r6, #1
_080977BE:
	ldr r1, _080977DC @ =sub_80974C0
	ldr r3, _080977E0 @ =0x00000513
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl sub_8099308
_080977CE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080977D8: .4byte 0x0202BCEC
_080977DC: .4byte 0x080974C1  @ sub_80974C0
_080977E0: .4byte 0x00000513

