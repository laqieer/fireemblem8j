	.syntax unified
	.set sub_807FB70, 0x0807FB70 + 1
	.section .text.sub_8083E80, "ax", %progbits
@ sub_8083E80 @ JP 0x08083E80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083E80
	.thumb_func
sub_8083E80:
	push {lr}
	ldr r2, _08083EA4 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08083EA8 @ =0x08A1FFD8
	ldr r2, _08083EAC @ =0x08A20600
	movs r3, #0x89
	bl sub_807FB70
	pop {r0}
	bx r0
	.align 2, 0
_08083EA4: .4byte 0x0203E1EC
_08083EA8: .4byte 0x08A1FFD8
_08083EAC: .4byte 0x08A20600

