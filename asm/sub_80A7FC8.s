	.syntax unified
	.set sub_8086AC4, 0x08086AC4 + 1
	.set sub_80A776C, 0x080A776C + 1
	.section .text.sub_80A7FC8, "ax", %progbits
@ sub_80A7FC8 @ JP 0x080A7FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7FC8
	.thumb_func
sub_80A7FC8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x64
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r6, #0
	bl sub_8086AC4
	adds r4, r0, #0
	cmp r5, #0
	bne _080A7FEA
	mov r5, sp
	mov r0, sp
	bl sub_80A776C
_080A7FEA:
	adds r3, r5, #0
	adds r3, #0x20
	b _080A7FF4
_080A7FF0:
	adds r6, #1
	adds r4, #0x10
_080A7FF4:
	ldrh r1, [r4]
	ldr r0, _080A802C @ =0x0000FFFF
	cmp r1, r0
	beq _080A8010
	cmp r1, r8
	bne _080A8006
	ldrh r0, [r4, #2]
	cmp r0, r7
	beq _080A8010
_080A8006:
	cmp r1, r7
	bne _080A7FF0
	ldrh r0, [r4, #2]
	cmp r0, r8
	bne _080A7FF0
_080A8010:
	asrs r0, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r1, r6, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	asrs r0, r1
	ands r0, r2
	add sp, #0x64
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A802C: .4byte 0x0000FFFF

