	.syntax unified
	.set CopyEventMoveREDAs, 0x0807C0DC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_807C270, 0x0807C270 + 1
	.section .text.sub_807C178, "ax", %progbits
@ sub_807C178 @ JP 0x0807C178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C178
	.thumb_func
sub_807C178:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _0807C1AC @ =0x08A13438
	movs r1, #5
	bl sub_8002BCC
	adds r5, r0, #0
	cmp r6, #0
	beq _0807C1B0
	cmp r6, #1
	beq _0807C1B4
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl CopyEventMoveREDAs
	adds r4, r0, #0
	b _0807C1C0
	.align 2, 0
_0807C1AC: .4byte 0x08A13438
_0807C1B0:
	movs r4, #0
	b _0807C1C0
_0807C1B4:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r5, #0x44]
	str r1, [r5, #0x48]
	adds r4, r5, #0
	adds r4, #0x44
_0807C1C0:
	str r7, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_807C270
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

