	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806C45C, "ax", %progbits
@ sub_806C45C @ JP 0x0806C45C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C45C
	.thumb_func
sub_806C45C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0806C4FC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C500 @ =0x08602E14
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #1
	strh r0, [r6, #0x2c]
	adds r5, #1
	strh r5, [r6, #0x2e]
	ldr r3, _0806C504 @ =0x086E2564
	cmp r4, #0
	beq _0806C498
	ldr r3, _0806C508 @ =0x086E255C
_0806C498:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r1, _0806C50C @ =0x08602E2C
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x32]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x3a]
	movs r0, #0x32
	ldrsh r2, [r6, r0]
	movs r1, #0x2c
	ldrsh r3, [r6, r1]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	bl sub_8012E84
	strh r0, [r4, #2]
	movs r0, #0x3a
	ldrsh r2, [r6, r0]
	movs r1, #0x2c
	ldrsh r3, [r6, r1]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl sub_8012E84
	strh r0, [r4, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C4FC: .4byte 0x0201774C
_0806C500: .4byte 0x08602E14
_0806C504: .4byte 0x086E2564
_0806C508: .4byte 0x086E255C
_0806C50C: .4byte 0x08602E2C

