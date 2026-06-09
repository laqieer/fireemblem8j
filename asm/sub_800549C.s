	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_800549C, "ax", %progbits
@ sub_800549C @ JP 0x0800549C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800549C
	.thumb_func
sub_800549C:
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, _080054BC @ =0x0202A688
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080054C0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_080054BC: .4byte 0x0202A688
_080054C0: .4byte 0x06010000

