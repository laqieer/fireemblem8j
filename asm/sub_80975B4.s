	.syntax unified
	.section .text.sub_80975B4, "ax", %progbits
@ sub_80975B4 @ JP 0x080975B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80975B4
	.thumb_func
sub_80975B4:
	push {lr}
	ldr r1, _080975C8 @ =0x0203E878
	movs r2, #0
	adds r0, r1, #4
_080975BC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080975BC
	pop {r0}
	bx r0
	.align 2, 0
_080975C8: .4byte 0x0203E878

