	.syntax unified
	.set CheckEfrDragonStatusAttrEnd, 0x080721C4 + 1
	.section .text.sub_8051ABC, "ax", %progbits
@ sub_8051ABC @ JP 0x08051ABC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051ABC
	.thumb_func
sub_8051ABC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEfrDragonStatusAttrEnd
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08051AD2
	ldr r0, _08051AD8 @ =sub_8051A2C
	str r0, [r4, #0xc]
_08051AD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051AD8: .4byte 0x08051A2D  @ sub_8051A2C

