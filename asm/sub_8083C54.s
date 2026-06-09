	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8083C54, "ax", %progbits
@ sub_8083C54 @ JP 0x08083C54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083C54
	.thumb_func
sub_8083C54:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08083C6C @ =0x0203E1EC
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083C68
	adds r0, r1, #0
	bl sub_8002DE4
_08083C68:
	pop {r0}
	bx r0
	.align 2, 0
_08083C6C: .4byte 0x0203E1EC

