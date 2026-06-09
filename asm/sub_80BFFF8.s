	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80BFFF8, "ax", %progbits
@ sub_80BFFF8 @ JP 0x080BFFF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFFF8
	.thumb_func
sub_80BFFF8:
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r1, #0x34
	ldr r2, _080C0014 @ =0x05000007
	mov r0, sp
	bl sub_80D6370
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C0014: .4byte 0x05000007

