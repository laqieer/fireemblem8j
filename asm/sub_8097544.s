	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8097544, "ax", %progbits
@ sub_8097544 @ JP 0x08097544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097544
	.thumb_func
sub_8097544:
	push {lr}
	ldr r0, _08097558 @ =0x08A93FE8
	bl Proc_Find
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809755C
	movs r0, #1
	b _0809755E
	.align 2, 0
_08097558: .4byte 0x08A93FE8
_0809755C:
	movs r0, #0
_0809755E:
	pop {r1}
	bx r1
	.align 2, 0

