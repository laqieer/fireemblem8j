	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C500C, "ax", %progbits
@ sub_80C500C @ JP 0x080C500C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C500C
	.thumb_func
sub_80C500C:
	push {lr}
	ldr r0, _080C5020 @ =0x08AC1FE4
	bl Proc_Find
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
_080C5020: .4byte 0x08AC1FE4

