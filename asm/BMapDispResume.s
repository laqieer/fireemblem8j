	.syntax unified
	.set BMapVSync_Start, 0x080300A0 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_UnblockEachMarked, 0x08002F64 + 1
	.section .text.BMapDispResume, "ax", %progbits
@ BMapDispResume @ JP 0x08030108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BMapDispResume
	.thumb_func
BMapDispResume:
	push {lr}
	ldr r1, _0803013C @ =0x0202BCAC
	ldrb r2, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08030138
	subs r0, r2, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030138
	movs r0, #1
	bl Proc_UnblockEachMarked
	ldr r0, _08030140 @ =0x085C5D98
	bl Proc_Find
	cmp r0, #0
	beq _08030138
	bl Proc_End
	bl BMapVSync_Start
_08030138:
	pop {r0}
	bx r0
	.align 2, 0
_0803013C: .4byte 0x0202BCAC
_08030140: .4byte 0x085C5D98

