	.syntax unified
	.set Proc_BreakEach, 0x08002FE4 + 1
	.set sub_8015EE8, 0x08015EE8 + 1
	.section .text.sub_80355A0, "ax", %progbits
@ sub_80355A0 @ JP 0x080355A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80355A0
	.thumb_func
sub_80355A0:
	push {lr}
	ldr r0, _080355BC @ =0x0202BCAC
	ldrh r1, [r0, #0x2a]
	subs r1, #0x10
	strh r1, [r0, #0x2a]
	movs r0, #0
	bl sub_8015EE8
	ldr r0, _080355C0 @ =0x085C6668
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_080355BC: .4byte 0x0202BCAC
_080355C0: .4byte 0x085C6668

