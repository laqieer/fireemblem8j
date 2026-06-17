	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set NewEfxTeonoOBJ2, 0x0805CEA0 + 1
	.section .text.EfxTeonoObjEnd, "ax", %progbits
@ EfxTeonoObjEnd @ JP 0x0805CE78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxTeonoObjEnd
	.thumb_func
EfxTeonoObjEnd:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805CE9C @ =0x02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl NewEfxTeonoOBJ2
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CE9C: .4byte 0x02017754

