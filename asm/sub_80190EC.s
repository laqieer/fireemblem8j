	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80190EC, "ax", %progbits
@ sub_80190EC @ JP 0x080190EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80190EC
	.thumb_func
sub_80190EC:
	push {lr}
	ldr r1, _08019104 @ =0x085C2A18
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	pop {r1}
	bx r1
	.align 2, 0
_08019104: .4byte 0x085C2A18

