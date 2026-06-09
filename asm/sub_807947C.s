	.syntax unified
	.set GetEkrDragonStatusType, 0x0807201C + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_807947C, "ax", %progbits
@ sub_807947C @ JP 0x0807947C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807947C
	.thumb_func
sub_807947C:
	push {lr}
	bl GetEkrDragonStatusType
	cmp r0, #2
	bne _08079492
	ldr r0, _08079498 @ =0x0884892C
	bl Proc_Find
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x54]
_08079492:
	pop {r0}
	bx r0
	.align 2, 0
_08079498: .4byte 0x0884892C

