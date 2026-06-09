	.syntax unified
	.section .text.Hardware_CopyViaDmaStruct, "ax", %progbits
@ Hardware_CopyViaDmaStruct @ JP 0x08001650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Hardware_CopyViaDmaStruct
	.thumb_func
Hardware_CopyViaDmaStruct:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldrh r0, [r1]
	ldrb r6, [r1]
	lsrs r0, r0, #8
	mov r8, r0
	movs r4, #0
	adds r1, #2
	movs r2, #0
	cmp r2, r8
	bge _08001690
_0800166A:
	lsls r0, r2, #6
	mov r5, ip
	adds r3, r5, r0
	adds r5, r2, #1
	cmp r6, #0
	beq _0800168A
	adds r2, r6, #0
_08001678:
	movs r7, #0
	ldrsh r0, [r1, r7]
	adds r4, r4, r0
	adds r1, #2
	strh r4, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _08001678
_0800168A:
	adds r2, r5, #0
	cmp r2, r8
	blt _0800166A
_08001690:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

