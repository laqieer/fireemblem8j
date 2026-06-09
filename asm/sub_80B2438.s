	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2438, "ax", %progbits
@ sub_80B2438 @ JP 0x080B2438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2438
	.thumb_func
sub_80B2438:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080B2484 @ =0x08A9DBB4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B2478
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
	strb r6, [r0, #1]
	strh r7, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r1, [r0, #7]
	strh r5, [r0, #8]
_080B2478:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2484: .4byte 0x08A9DBB4

