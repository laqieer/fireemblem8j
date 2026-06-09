	.syntax unified
	.set AllocateProcess, 0x08002CD4 + 1
	.set InsertChildProcess, 0x08002D18 + 1
	.set InsertRootProcess, 0x08002CF4 + 1
	.set sub_80032E0, 0x080032E0 + 1
	.section .text.sub_8002BCC, "ax", %progbits
@ sub_8002BCC @ JP 0x08002BCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002BCC
	.thumb_func
sub_8002BCC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl AllocateProcess
	adds r5, r0, #0
	str r4, [r5]
	str r4, [r5, #4]
	movs r0, #0
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	movs r1, #0
	strh r0, [r5, #0x24]
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	cmp r6, #7
	bgt _08002C0E
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertRootProcess
	b _08002C16
_08002C0E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl InsertChildProcess
_08002C16:
	adds r0, r5, #0
	bl sub_80032E0
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

