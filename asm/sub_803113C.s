	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEachMarked, 0x08002F90 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_803113C, "ax", %progbits
@ sub_803113C @ JP 0x0803113C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803113C
	.thumb_func
sub_803113C:
	push {lr}
	movs r0, #1
	bl Proc_EndEachMarked
	ldr r0, _0803115C @ =0x085C2670
	bl Proc_Find
	ldr r2, [r0, #0x54]
	adds r2, #0x28
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0803115C: .4byte 0x085C2670

