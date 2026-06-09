	.syntax unified
	.set HideMu, 0x0807BBE8 + 1
	.section .text.sub_808405C, "ax", %progbits
@ sub_808405C @ JP 0x0808405C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808405C
	.thumb_func
sub_808405C:
	push {lr}
	ldr r2, _0808407C @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl HideMu
	pop {r0}
	bx r0
	.align 2, 0
_0808407C: .4byte 0x0203E1EC

