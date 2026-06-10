	.syntax unified
	.set SetFaceDisplayBits, 0x08005678 + 1
	.set sub_80056AC, 0x080056AC + 1
	.section .text.sub_800885C, "ax", %progbits
@ sub_800885C @ JP 0x0800885C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800885C
	.thumb_func
sub_800885C:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080088AC @ =0x080DC548
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _080088A2
	ldr r4, _080088B0 @ =0x085B90D4
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_80056AC
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl SetFaceDisplayBits
_080088A2:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080088AC: .4byte 0x080DC548
_080088B0: .4byte 0x085B90D4

