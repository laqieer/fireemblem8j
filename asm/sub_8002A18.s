	.syntax unified
	.set DeleteAll6CWaitMusicRelated, 0x08002A08 + 1
	.set m4aMPlayFadeOut, 0x080D508C + 1
	.section .text.sub_8002A18, "ax", %progbits
@ sub_8002A18 @ JP 0x08002A18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002A18
	.thumb_func
sub_8002A18:
	push {lr}
	bl DeleteAll6CWaitMusicRelated
	ldr r0, _08002A3C @ =0x03006430
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08002A40 @ =0x03006640
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08002A44 @ =0x02024E5C
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08002A3C: .4byte 0x03006430
_08002A40: .4byte 0x03006640
_08002A44: .4byte 0x02024E5C

