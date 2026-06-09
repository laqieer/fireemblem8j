	.syntax unified
	.set CheckEkrPopupEnded, 0x08077F54 + 1
	.set sub_8077F70, 0x08077F70 + 1
	.section .text.sub_80519DC, "ax", %progbits
@ sub_80519DC @ JP 0x080519DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80519DC
	.thumb_func
sub_80519DC:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrPopupEnded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080519F4
	bl sub_8077F70
	ldr r0, _080519FC @ =sub_8051A00
	str r0, [r4, #0xc]
_080519F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080519FC: .4byte 0x08051A01  @ sub_8051A00

