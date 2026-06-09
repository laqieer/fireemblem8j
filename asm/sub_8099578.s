	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8099578, "ax", %progbits
@ sub_8099578 @ JP 0x08099578 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099578
	.thumb_func
sub_8099578:
	push {lr}
	ldr r0, _08099588 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	bne _0809958C
	movs r0, #0
	b _08099590
	.align 2, 0
_08099588: .4byte 0x08A94430
_0809958C:
	adds r0, #0x2b
	ldrb r0, [r0]
_08099590:
	pop {r1}
	bx r1

