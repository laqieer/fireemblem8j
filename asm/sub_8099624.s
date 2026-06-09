	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8099624, "ax", %progbits
@ sub_8099624 @ JP 0x08099624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099624
	.thumb_func
sub_8099624:
	push {lr}
	ldr r0, _08099634 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	bne _08099638
	movs r0, #0
	b _0809963A
	.align 2, 0
_08099634: .4byte 0x08A94430
_08099638:
	movs r0, #1
_0809963A:
	pop {r1}
	bx r1
	.align 2, 0

