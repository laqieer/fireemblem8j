	.syntax unified
	.section .text.ProcCmd_SLEEP, "ax", %progbits
@ ProcCmd_SLEEP @ JP 0x080031F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcCmd_SLEEP
	.thumb_func
ProcCmd_SLEEP:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _0800320E
	strh r2, [r1, #0x24]
	ldr r0, _0800321C @ =sub_80031DC
	str r0, [r1, #0xc]
_0800320E:
	ldr r0, [r1, #4]
	adds r0, #8
	str r0, [r1, #4]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800321C: .4byte 0x080031DD  @ sub_80031DC

