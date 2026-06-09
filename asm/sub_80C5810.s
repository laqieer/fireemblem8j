	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C5810, "ax", %progbits
@ sub_80C5810 @ JP 0x080C5810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5810
	.thumb_func
sub_80C5810:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C582C @ =0x08AC2278
	bl Proc_Find
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #2]
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C582C: .4byte 0x08AC2278

