	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80A8F78, 0x080A8F78 + 1
	.set sub_80A8FD8, 0x080A8FD8 + 1
	.section .text.sub_80A94E8, "ax", %progbits
@ sub_80A94E8 @ JP 0x080A94E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A94E8
	.thumb_func
sub_80A94E8:
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A9554 @ =0x0203A4E8
	adds r0, r4, #0
	bl sub_8018E64
	cmp r0, #0
	bne _080A94FE
	adds r7, r4, #0
	ldr r5, _080A9558 @ =0x0203A568
_080A94FE:
	ldr r6, _080A9558 @ =0x0203A568
	adds r0, r6, #0
	bl sub_8018E64
	cmp r0, #0
	bne _080A950E
	adds r7, r6, #0
	adds r5, r4, #0
_080A950E:
	cmp r7, #0
	beq _080A954C
	cmp r5, #0
	beq _080A9534
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A9534
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A8F78
	ldr r1, _080A955C @ =0x0202BCEC
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080A9534:
	cmp r7, #0
	beq _080A954C
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A954C
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl sub_80A8FD8
_080A954C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9554: .4byte 0x0203A4E8
_080A9558: .4byte 0x0203A568
_080A955C: .4byte 0x0202BCEC

