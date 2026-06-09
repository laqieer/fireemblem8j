	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C8418, "ax", %progbits
@ sub_80C8418 @ JP 0x080C8418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8418
	.thumb_func
sub_80C8418:
	push {lr}
	ldr r0, _080C843C @ =0x08AC2808
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080C8438
	ldr r2, _080C8440 @ =0x0201BE30
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080C8438:
	pop {r0}
	bx r0
	.align 2, 0
_080C843C: .4byte 0x08AC2808
_080C8440: .4byte 0x0201BE30

